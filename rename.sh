for repo in $(curl -u $GH_USERNAME:$GH_TOKEN -H 'Accept: application/vnd.github.v3+json' 'https://api.github.com/user/repos?type=owner&page=1' | jq '.[] | select(.fork == false) | select(.default_branch == "main") | .full_name' | sed 's/"//g')
do
    git clone https://$GH_USERNAME:$GH_TOKEN@github.com/$repo repo_to_be_renamed
    cd repo_to_be_renamed
    git branch -m main master
    git push -u origin master
    curl -u $GH_USERNAME:$GH_TOKEN -H "Accept: application/vnd.github.v3+json" -XPATCH https://api.github.com/repos/$repo -d '{"default_branch": "master"}'
    cd ..
    rm -rf ./repo_to_be_renamed
done