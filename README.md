# rename-branch
A little bash script to help you rename all of your Github repository default branches back to `master` from `main`.

# Dependencies
- curl
- jq

# Usage

[Create a Github Personal Access Token](https://github.com/settings/tokens/new)

Then execute the following in your terminal
```bash
export GH_USERNAME=your-username
export GH_TOKEN=the-token-above
./rename.sh # or sh rename.sh
```

# Pagination
If you have more than 30 repos you will need to adjust the pagination accordingly.

# License

[LICENSE](LICENSE)