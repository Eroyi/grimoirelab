{{/*
  Mordred setup config
*/}}
{{- define "config.mordredSetup" -}}
[general]
short_name = GrimoireLab
update = true
min_update_delay = 60
debug = false
logs_dir = /home/grimoire/logs
bulk_size = 100
scroll_size = 100
aliases_file = /home/grimoire/aliases.json

[projects]
projects_file = /home/grimoire/conf/projects.json

[es_collection]
url = https://admin:{{ include "cred.opensearchNode.password" . }}@opensearchNode:{{ include "port.opensearchNode" . }}

[es_enrichment]
url = https://admin:{{ include "cred.opensearchNode.password" . }}@opensearchNode:{{ include "port.opensearchNode" . }}
autorefresh = true

[sortinghat]
host = nginx
user = root
password = root
port = {{ include "port.nginxListen" . }}
path = /identities/api/
ssl = false
database = sortinghat_db
autoprofile = [github, git]
matching = [email,name,username]
sleep_for = 100
unaffiliated_group = Unknown
affiliate = true

[panels]
kibiter_time_from =
kibiter_default_index =
kibiter_url =
kibiter_version =

[phases]
collection = true
identities = true
enrichment = true
panels = false

#[bugzillarest]
#raw_index = bugzillarest_demo_raw
#enriched_index = bugzillarest_demo_enriched
#no-archive = true

#[confluence]
#no-archive = true
#raw_index = confluence_demo_raw
#enriched_index = confluence_demo_enriched

#[discourse]
#raw_index = discourse_demo_raw
#enriched_index = discourse_demo_enriched
#no-archive = true

[git]
raw_index = git_demo_raw
enriched_index = git_demo_enriched
latest-items = true
studies = [enrich_demography:git, enrich_areas_of_code:git, enrich_onion:git]

#[github]
#api-token = <YOUR_API_TOKEN_WHERE>
#enterprise-url = <YOUR_GITHUB_ENTERPRISE_URL>
#raw_index = github_demo_raw
#sleep-for-rate = true
#sleep-time = "300"
#enriched_index = github_demo_enriched

#[gitlab:issues]
#api-token = <YOUR_API_TOKEN_HERE>
#raw_index = gitlab_issues_demo_raw
#enriched_index = gitlab_issues_demo_enriched
#no-archive = true
#enterprise-url = <YOUR_GITLAB_INSTANCE_URL>
#sleep-for-rate = true

#[gitlab:merge]
#api-token = <YOUR_API_TOKEN_HERE>
#raw_index = gitlab_merges_demo_raw
#enriched_index = gitlab_merges_demo_enriched
#no-archive = true
#enterprise-url = <YOUR_GITLAB_INSTANCE_URL>
#category = merge_request
#sleep-for-rate = true

#[jira]
#raw_index = jira_demo_raw
#enriched_index = jira_demo_enriched
#no-archive = true

#[pipermail]
#raw_index = pipermail_demo_raw
#enriched_index = pipermail_demo_enriched
#no-verify = true

#[mediawiki]
#raw_index = mediawiki_demo_raw
#enriched_index = mediawiki_demo_enriched
#no-archive = true

#[meetup]
#raw_index = meetup_demo_raw
#enriched_index = meetup_demo_enriched
#api-token = <YOUR_API_TOKEN_WHERE>
#no-archive = true
#sleep-for-rate = true
#sleep-time = "300"

#[stackexchange]
#raw_index = stackexchange_demo_raw
#enriched_index = stackexchange_demo_enriched
#api-token = <YOUR_API_TOKEN_WHERE>
#no-archive = true

#[slack]
#raw_index = slack_demo_raw
#enriched_index = slack_demo_enriched
#api-token = <YOUR_API_TOKEN_WHERE>
#no-archive = true

#[supybot]
#raw_index = supybot_demo_raw
#enriched_index = supybot_demo_enriched

#[twitter]
#raw_index = twitter_demo_raw
#enriched_index = twitter_demo_enriched
#api-token = <YOUR_API_TOKEN_WHERE>
#no-archive = true
#sleep-for-rate = true
#sleep-time = 300

## studies based on enriched indexes

[enrich_demography:git]

[enrich_areas_of_code:git]
in_index = git_demo_raw
out_index = git-aoc_demo_enriched

[enrich_onion:git]
in_index = git
out_index = git-onion_demo_enriched
contribs_field = hash
{{- end }}
