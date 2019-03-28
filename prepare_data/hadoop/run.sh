#!/bin/bash
source /home/d5hadoop/new/d5hadoop_env.sh
hadoop fs -put data/raw/postids.txt reddit_ham_postids.txt

hadoop jar $CDH_MR2_HOME/hadoop-streaming.jar -file mapper.py -mapper mapper.py -file reducer.py -reducer reducer.py -cacheFile 'reddit_ham_postids.txt#reddit_ham_postids.txt' -input 'reddit_*/*' -output reddit_ham_data && \
hadoop fs -get reddit_ham_data/part-00000 data/raw/posts.txt


