import requests
import re
import os

dev_settings = '.m2/settings.dev.xml'
groupId = "org.springframework"
artifactId = "spring"
version = "99.0-does-not-exist"
filename = "spring-99.0-does-not-exist.pom"
filetype = "pom"
dev_repo_path = "http://dev.artifactory.example.net/artifactory/My-Dev-Release"
cmdTemp = 'mvn deploy:deploy-file -s ' + dev_settings + ' -Dpackaging={file_type} -Dfile={jar_file} -DgroupId={groupId} -DartifactId={artifactId} -Dversion={version} -Durl={repository_url} -DrepositoryId=central-dev'
cmd = cmdTemp.format(file_type = filetype, jar_file = filename, groupId = groupId, artifactId = artifactId, version = version, repository_url = dev_repo_path)
print(cmd);
os.system(cmd)
filename = "spring-99.0-does-not-exist.jar"
filetype = "jar"
cmdTemp = 'mvn deploy:deploy-file -s ' + dev_settings + ' -Dpackaging={file_type} -Dfile={jar_file} -DgroupId={groupId} -DartifactId={artifactId} -Dversion={version} -Durl={repository_url} -DrepositoryId=central-dev'
cmd = cmdTemp.format(file_type = filetype, jar_file = filename, groupId = groupId, artifactId = artifactId, version = version, repository_url = dev_repo_path)
print(cmd);
os.system(cmd)
#sources
sourcefilename= "batch_download\\aat-case-mng-1.0.0.20180930-sources.jar"
filename = "batch_download\\aat-case-mng-1.0.0.20180930.jar"
groupId = "com.aaa.tt"
artifactId = "aat-case-mng"
version = "1.0.0.20180930"
filetype = "jar"
cmdTemp = 'mvn deploy:deploy-file -s ' + dev_settings + ' -Dpackaging={file_type} -Dfile={jar_file} -DgroupId={groupId} -DartifactId={artifactId} -Dversion={version} -Durl={repository_url} -DrepositoryId=central-dev -Dsources={sourcefilename}'
cmd = cmdTemp.format(file_type = filetype, jar_file = filename, groupId = groupId, artifactId = artifactId, version = version, repository_url = dev_repo_path, sourcefilename = sourcefilename)
print(cmd);
os.system(cmd)
