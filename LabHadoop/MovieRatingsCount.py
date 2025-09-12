from mrjob.job import MRJob
from mrjob.step import MRStep

class MovieRatingsCount(MRJob):
    def steps(self):
        return [
            MRStep(
                mapper=self.mapper_movie_to_one,
                reducer=self.reducer_sum_counts
            ),
            MRStep(
                mapper=self.mapper_invert_for_sort,
                reducer=self.reducer_emit_sorted,
                jobconf={
                    'mapreduce.job.reduces': '1',
                    'stream.num.map.output.key.fields': '1',
                    'mapreduce.partition.keycomparator.options': '-k1,1nr'
                }
            )
        ]

    # u.data: user_id \t movie_id \t rating \t timestamp
    def mapper_movie_to_one(self, _, line):
        parts = line.strip().split('\t')
        if len(parts) >= 2:
            movie_id = parts[1]
            yield movie_id, 1

    def reducer_sum_counts(self, movie_id, ones):
        yield movie_id, sum(ones)

    def mapper_invert_for_sort(self, movie_id, total):
        yield int(total), movie_id

    def reducer_emit_sorted(self, total, movie_ids):
        for mid in movie_ids:
            yield total, mid

if __name__ == '__main__':
    MovieRatingsCount.run()
