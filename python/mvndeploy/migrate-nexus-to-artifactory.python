import requests
import re
import os

repo = 'My-Dev-Repo'
#offset = 79 # length of repo name
offset = 75 # length of repo name
classifier = 'ap-my'

release_repo_path = 'http://mvn.example.net/nexus/content/repositories/My-Release/'

dev_repo_domain = 'http://dev.artifactory.example.com/'
dev_repo_path = dev_repo_domain + 'artifactory/' + repo
dev_admin_account = 'admin'
dev_admin_password = '...'
dev_settings = '.m2/settings.dev.xml'

local_folder = './batch_download'
local_log_file = './batch_download.txt'

migrate_folders = ['org'] # sub folders will be included

def clean():
	try:
	    os.remove(local_log_file)
	except OSError as e:
	    print("Error: %s - %s." % (e.filename, e.strerror))

	if not os.path.exists(local_folder):
	    os.makedirs(local_folder)

def download(_parent_path, _folders):
	# print('_parent_path: ' +_parent_path)
	f = open(local_log_file, 'a')
	for folder in _folders:
		full_path = _parent_path + folder
		print("=======================================================================")
		print(full_path)
		print("=======================================================================")
		r = requests.get(full_path)
		p1 = re.compile(r'\">(.*)\/<\/a')
		sub_folders = p1.findall(r.text)
		if r.status_code != 200:
			print('response code: ' + str(r.status_code))
		else:
			p2 = re.compile(r'\">(.*)\.pom')
			pom_files = list(set(p2.findall(r.text)))
			#print(pom_files)
			for pom_file in pom_files:
				filepath = full_path + '/' + pom_file + '.pom'				
				items = full_path[offset:].split('/')
				print(items)
				groupId = '.'.join(items[0:-2])				
				f.write(groupId + ',' + items[-2] + ',' + items[-1] + ',' + pom_file + '.pom' + '\n') 
				try:
					download_file(filepath)
				except requests.exceptions.HTTPError as e:
					print ("Error: %s." % (e.strerror))

			p3 = re.compile(r'\">(.*)\.jar')
			jar_files = list(set(p3.findall(r.text)))
			# print(jar_files)
			for jar_file in jar_files:
				#if "source" not in jar_file:
					filepath = full_path + '/' + jar_file + '.jar'
					items = full_path[offset:].split('/')
					groupId = '.'.join(items[0:-2])
					f.write(groupId + ',' + items[-2] + ',' + items[-1] + ',' + jar_file + '.jar' + '\n') 
					try:
						download_file(filepath)
					except requests.exceptions.HTTPError as e:
						print ("Error: %s." % (e.strerror))

			p4 = re.compile(r'\">(.*)\.ce-plugin')
			plugin_files = list(set(p4.findall(r.text)))
			# print(plugin_files)
			for plugin_file in plugin_files:
				filepath = full_path + '/' + plugin_file + '.ce-plugin'
				items = full_path[offset:].split('/')
				groupId = '.'.join(items[0:-2])
				f.write(groupId + ',' + items[-2] + ',' + items[-1] + ',' + plugin_file + '.ce-plugin' + '\n') 
				try:
					download_file(filepath)
				except requests.exceptions.HTTPError as e:
					print ("Error: %s." % (e.strerror))

			download(full_path + '/', sub_folders)
	f.close()

def download_file(url):
    local_filename = local_folder + '/' + url.split('/')[-1]
    # NOTE the stream=True parameter below
    with requests.get(url, stream=True) as r:
        r.raise_for_status()
        with open(local_filename, 'wb') as f:
            for chunk in r.iter_content(chunk_size=8192): 
                if chunk: # filter out keep-alive new chunks
                    f.write(chunk)
                    # f.flush()
    return local_filename

def upload():
	with open(local_log_file) as f:
		content = f.readlines()
		content = [x.strip() for x in content]
		for line in content:
			items = line.split(',')
			groupId = items[0]
			artifactId = items[1]
			version = items[2]
			filename = items[3]
			filetype = filename.split('.')[-1]
			sourcefile = items[3]
			if "source" not in filename:
				cmdTemp = 'mvn deploy:deploy-file -s ' + dev_settings + ' -Dpackaging={file_type} -Dfile={jar_file} -DgroupId={groupId} -DartifactId={artifactId} -Dversion={version} -Durl={repository_url} -DrepositoryId=central-dev'
				cmd = cmdTemp.format(file_type = filetype, jar_file = local_folder + '/' + filename, groupId = groupId, artifactId = artifactId, version = version, repository_url = dev_repo_path)
				print(cmd);
				os.system(cmd)
			else:				
				cmdTemp = 'mvn deploy:deploy-file -s ' + dev_settings + ' -Dpackaging={file_type} -Dfile={jar_file} -DgroupId={groupId} -DartifactId={artifactId} -Dversion={version} -Durl={repository_url} -DrepositoryId=central-dev -Dsources={sourcefile}'				
				filename = filename.replace("-sources", "")
				cmd = cmdTemp.format(file_type = filetype, jar_file = local_folder + '/' + filename, groupId = groupId, artifactId = artifactId, version = version, repository_url = dev_repo_path, sourcefile = local_folder + '/' + sourcefile)
				print(cmd);
				os.system(cmd)

# step 1 - download
clean()
download(release_repo_path, migrate_folders)

# step 2 - upload
upload()
