# deepl-fix-english
Use DeepL translator to fix English texts (through EN->DE->EN pipeline)

# Requirements
- Some unix with shell (tested on Linux Mint)
- `jq` for parsing JSON (install using `sudo apt install jq`)
- `curl` for making POST request to deepl json rpc server (install using `sudo apt install curl`)

# Installation
Download the `deepl-fix-english.sh` file and make sure it is executable.
The easiest way is to clone the latest version from github as follows:
```sh
git clone --depth 1 https://github.com/vsimko/deepl-fix-english.git
cd deepl-fix-english
```

# Usage (short sentences)
For shorter texts use command line arguments
```sh
$ ./deepl-fix-english.sh Please translate this text
```
output
```
######################################################################## 100,0%
######################################################################## 100,0%
Please translate the following text
```

# Usage (larger texts)
Multiline texts can be piped to the script through stdin as follows:
```sh
$ ./deepl-fix-english.sh
```
now you can write or copy-paste to console and hit ENTER and CTRL+D when finished:
```
This document contains multiple 
lines and should also be translated
by DeepL without problems. (hit ENTER and CTRL+D)
######################################################################## 100,0%
######################################################################## 100,0%
This document contains several lines and should be easily translated by DeepL.
```
or from file
```sh
$ ./deepl-fix-english.sh < my_file_to_fix.txt
######################################################################## 100,0%
######################################################################## 100,0%
This document contains several lines and should be easily translated by DeepL.
```
