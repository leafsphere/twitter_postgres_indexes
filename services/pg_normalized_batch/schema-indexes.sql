\set ON_ERROR_STOP on

CREATE INDEX tweets_idx1 ON tweets(id_tweets);

CREATE INDEX tweets_idx2 ON tweets USING gin(to_tsvector('english',text)) WHERE lang='en';

CREATE INDEX tweet_tags_idx1 ON tweet_tags(id_tweets, tag);

CREATE INDEX tweet_tags_idx2 ON tweet_tags(tag, id_tweets);
