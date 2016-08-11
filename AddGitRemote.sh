#!/bin/bash

separator="/"
project_suffix=".git"

#提供多个git远程同步仓库
project_name=$1
masterRemote=$2

echo "WARNING：请确保一定在当前项目下执行添加多个远程仓库的脚本"

if [ ! $project_name ]; then
  read -p "请输入项目名称："
  if [ $REPLY ]; then
    project_name=$REPLY
  fi
fi

if [ ! $project_name ]; then
  echo "项目名称无效"
  exit
fi

read -p "即将使用"$project_name"作为项目名称。请确认（y/n）:"
if [ $REPLY != "y" -a $REPLY != "Y" ]; then
  exit
fi

declare -A gitRepo=(["github"]="https://github.com/zhngjan" ["osc"]="https://git.oschina.net/zhngjan" ["coding"]="https://git.coding.net/zhngjan" ["bitbucket"]="https://zhngjan@bitbucket.org/zhngjan" ["gitlab"]="https://gitlab.com/zhngjan")

masterRepoName="github"
if [ $masterRemote ]; then
  masterRepoName=$masterRemote
else
  read -p "即将使用"$masterRepoName"作为第一个创建别名（all）,如果需要更换请输入以下其中一个["'${gitRepo[@]}'"]:"
  if [ $REPLY ]; then
    masterRepoName=$REPLY
  fi
fi

masterRepoSite=${gitRepo[$masterRepoName]}
if [ ! $masterRepoSite ]; then
  echo "not found git remote repository for "$masterRepoName
  exit
fi

repoExt=$separator$project_name$project_suffix

masterRepo=$masterRepoSite$repoExt
echo "创建 git remote all："$masterRepo
git remote add all $masterRepo

for key in ${!gitRepo[@]}
do
  echo "removing remote repository:"$key
  git remote remove $key
  repo=${gitRepo[$key]}$repoExt
  echo "adding remote "$key" "$repo
  git remote add $key $repo
  if [ "$masterRepo" = "$key"]; then
    echo "adding remote all "$repo
    git remote set-url --add all $repo
  fi
done

echo "add git remote done."

git remote -v

