import pyspark
sc = pyspark.SparkContext('spark://spark-master:7077')
text_file = sc.textFile("hdfs:///home/wordcount.txt")
counts = text_file.flatMap(lambda line: line.split(" ")) \
             .map(lambda word: (word, 1)) \
             .reduceByKey(lambda a, b: a + b)
counts.saveAsTextFile("hdfs:///home/wordcount_results_spark")
