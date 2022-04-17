\set ON_ERROR_STOP on

CREATE INDEX tweets_jsonb_idx1 ON tweets_jsonb
 USING gin((data->'entities'->'hashtags'));

CREATE INDEX tweets_jsonb_idx2 ON tweets_jsonb
 USING gin((data->'extended_tweet'->'entities'->'hashtags'));

CREATE INDEX tweets_jsonb_idx3 ON tweets_jsonb
 USING gin(to_tsvector('english',COALESCE(data->'extended_tweet'->>'full_text',data->>'text')))
 WHERE data->>'lang'='en';

CREATE INDEX tweets_jsonb_idx4 ON tweets_jsonb((data->>'lang'));
