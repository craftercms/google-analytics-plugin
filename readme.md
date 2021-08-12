# Google Analytics Plugin for Crafter CMS

This is a plugin to add Google Analytics to your site.

# Installation

The plugin can be installed to your site from the Crafter CMS Marketplace

# Setup

After the plugin has been installed you can enable it by adding the following snippet in your
`Engine Site Configuration` file:

```xml
<plugins>
  <googleAnalytics>
    <enabled>...</enabled>
    <id>UA-XXXX</id>
    <anonymizeIp>...</anonymizeIp>
  </googleAnalytics>
</plugins>
```

# Configuration

- `enabled`: Indicates if the Google Analytics plugin should be added to all pages, defaults to `false` if the site
  is running in preview mode, `true` otherwise
- `id`: The tracking id that starts with `UA-` (for GA v3) or `G-` (for GA v4)
- `anonymizeIp`: Indicates if the IP address should be anonymized, defaults to `false`

Example:

```xml
<plugins>
  <googleAnalytics>
    <id>UA-XXXX</id>
    <anonymizeIp>true</anonymizeIp>
  </googleAnalytics>
</plugins>
```

# Page Override

If the plugin is enabled in the site configuration but some pages should not include the Google Analaytics markup it
is possible to override the configuration using a field in the content-type:

| Field Type |  Field Name          |
|------------|----------------------|
| `checkbox` | `disableGoogleAnalytics_b` |

When the property is added to a content-type authors can use it do control which pages are excluded.
