import findspark
import time
findspark.init()


from pyspark.conf import SparkConf
from pyspark.context import SparkContext
conf = SparkConf()
conf.setMaster('yarn')
sc = SparkContext(conf=conf)


timestamp = int(time.time())




text_file = sc.textFile("hdfs:///home/wordcount.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile("hdfs:///home/" + str(timestamp) +  "_wordcount_results_spark" )
print(counts.collect())
