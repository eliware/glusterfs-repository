# Published blog content

Each JSON file in this directory is a published or draft blog document read by
the repository HTTP service. The service validates the schema before exposing
any post through the website, API, RSS, or sitemap.

Schema version 2 requires `metadata_version`, `schema`, `slug`, `title`,
`summary`, `published_at`, `updated_at`, `created_at`, `author`, `tags`,
`content_format`, `category`, `last_verified_at`, `tested_on`, `status`, and
`content`. The current content format is Markdown.

Technical posts should state the platforms tested and the date they were last
verified. Update `updated_at` whenever the article changes and update
`last_verified_at` whenever commands or package behavior are rechecked.

Use lowercase slug-style tags and one of these categories:

- `installation`
- `upgrades`
- `operations`
- `architecture`
- `troubleshooting`
- `releases`
- `security`
- `kubernetes`

Drafts remain in this directory for review but are excluded from public pages,
RSS, APIs, and the sitemap. Keep filenames descriptive and stable; the
internal `slug` is the canonical article identifier.
