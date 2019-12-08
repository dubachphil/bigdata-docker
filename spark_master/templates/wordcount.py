from pyspark.sql import SparkSession
import time

spark = SparkSession.builder.appName("Wordcount_Lorem_Ipsum").getOrCreate()
sc = spark.sparkContext

timestamp = int(time.time())
text_file = sc.textFile("hdfs:///home/wordcount.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile("hdfs:///home/" + str(timestamp) +  "_wordcount_results_spark" )
print(sc.textFile("hdfs:///home/" + str(timestamp) +  "_wordcount_results_spark").collect())
