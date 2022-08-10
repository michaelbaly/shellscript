1
#!/bin/bash
2
 
3
##############################
4
# settings and inicilization #
5
##############################
6
 
7
SVN_SOURCE="https://svn.example.com/trunk/"
8
REV_PATH="/var/www/revisions/example.com/"
9
PATCH_PATH="/var/www/patch/example.com/"
10
SYM_PATH="/var/www/public/example.com"
11
 
12
TIME_SPENT=$(date +%s)
13
REV=$(svn info $SVN_SOURCE | grep Revision | cut -d ' ' -f 2)
14
PREV=0
15
VERBOSIVE=0
16
 
17
USAGE_INFO="$(basename "$0") [-r REVISION_NUM] [-i PREVIOUS_REVISION_NUM] -- make an incremental svn export
18
 
19
where:
20
  -i  previous revision (default: 0)
21
  -h  show this help text
22
  -r  revision to export (default: $REV)
23
  -v  verbosive mode. show fetched files
24
 
25
current settins:
26
  SVN_SOURCE: $SVN_SOURCE
27
  REV_PATH:   $REV_PATH
28
  PATCH_PATH: $PATCH_PATH
29
  SYM_PATH:   $SYM_PATH
30
"
31
 
32
while getopts r:i:hv option; do
33
  case "$option" in
34
    i)  PREV=$OPTARG
35
        ;;
36
    h)  echo "$USAGE_INFO"
37
        exit
38
        ;;
39
    r)  REV=$OPTARG
40
        ;;
41
    v)  VERBOSIVE=1
42
        ;;
43
  esac
44
done
45
 
46
EV_PATH=$REV_PATH$REV"/"
47
 
48
##############################
49
#         functions          #
50
##############################
51
 
52
promtYesOrDie(){
53
  while true; do
54
    read -e -p "$1 (y/n): " -i "y" yn
55
    case $yn in
56
      [Yy] ) break;;
57
      [Nn] ) echo "spent: "$((`date +%s` - $TIME_SPENT))"s"
58
             echo "bye bye"
59
             exit
60
             ;;
61
         * ) echo "Please answer (y)es or (n)o.";;
62
    esac
63
  done
64
}
65
 
66
doIncrementalExport(){
67
  PREV_PATH=$REV_PATH$PREV"/"
68
  if [ -d $PREV_PATH ]; then
69
    echo "copying files from: $PREV_PATH"
70
    cp -f -r "$PREV_PATH." $EV_PATH
71
    echo "fetching added and modified files since revision $PREV..."
72
    for FILE_SRC in $(svn diff --summarize -r $PREV:$REV $SVN_SOURCE | awk '/[AM]/ {print $2}'); do
73
      FILE_PATH=$(echo $FILE_SRC | sed -e "s{$SVN_SOURCE{{");
74
      if [ ! -d "$EV_PATH$FILE_PATH" ]; then
75
        TRG_DIR="$EV_PATH$(dirname $FILE_PATH)"
76
        mkdir -p $TRG_DIR
77
        svn export -r$REV -q --force $FILE_SRC "$EV_PATH$FILE_PATH"
78
        if [ $VERBOSIVE -eq 1 ]; then
79
          echo "$EV_PATH$FILE_PATH"
80
        fi
81
      fi
82
    done
83
    echo "removing deleted files and folders since revision $PREV ..."
84
    for FILE_SRC in $(svn diff --summarize -r $PREV:$REV $SVN_SOURCE | awk '/D/ {print $2}'); do
85
      FILE_PATH=$(echo $FILE_SRC | sed -e "s{$SVN_SOURCE{{");
86
      rm -r "$EV_PATH$FILE_PATH"
87
      if [ $VERBOSIVE -eq 1 ]; then
88
        echo "$EV_PATH$FILE_PATH"
89
      fi
90
    done
91
  else
92
    echo "previous revision does not exist at: $PREV_PATH"
93
    exit;
94
  fi
95
}
96
 
97
##############################
98
#       main function        #
99
##############################
100
 
101
if [ $PREV -eq 0 ]; then
102
  promtYesOrDie "Do you want to do full export instead of incremental, for revision $REV of repo: [$SVN_SOURCE]"
103
  echo "fatching source ..."
104
  if [ $VERBOSIVE -eq 1 ]; then
105
    svn export -r$REV --force $SVN_SOURCE $EV_PATH
106
  else
107
    svn export -r$REV -q --force $SVN_SOURCE $EV_PATH
108
  fi
109
else
110
  promtYesOrDie "Do you want to do incremental export, for revision renge $PREV:$REV of repo: [$SVN_SOURCE]"
111
  doIncrementalExport
112
fi
113
 
114
echo "patching from $PATCH_PATH .."
115
cp -f -r "$PATCH_PATH." $EV_PATH
116
 
117
echo "changing owners and permissions .."
118
chown www-data:www-data -R $EV_PATH
119
chmod 0775 -R $EV_PATH
120
 
121
promtYesOrDie "Do you want to make the changes to do live? You should do it manually if got any error!"
122
echo "update symlink $SYM_PATH to $EV_PATH"
123
ln -sfn $EV_PATH $SYM_PATH
124
 
125
promtYesOrDie "Do you want to restart web server?"
126
echo "restarting php-fastcgi and nginx"
127
/etc/init.d/php-fastcgi restart
128
/etc/init.d/nginx restart
129
 
130
#echo "restarting apache"
131
#/etc/init.d/apache2 restart
132
 
133
echo "spent: "$((`date +%s` - $TIME_SPENT))"s"
134
echo [done]
