# Analytics Plugin for Crafter CMS

This is a very simple but highly configurable plugin to add analytics to your site.

# Installation

The plugin can be installed to your site from the Crafter CMS Marketplace

# Setup

After the plugin has been installed you can enable it by adding the following snippet in your site configuration:

```xml
<plugins>
  <analytics>
    <enabled>...</enabled>
    <provider>...</provider>
    <settings>
      ...
    </settings>
  </analyics>
</plugins>
```

# Configuration

- `enabled`: Indicates if the analytics plugin should be added to all pages, defaults to `false` if the site is running
  in preview mode, `true` otherwise

Every provider can support different settings:

## Google Analytics v3

The `provider` value must be set to `googleAnalytics`

- `id`: The tracking id that starts with `UA-`
- `anonymizeIp`: Indicates if the IP address should be anonymized, defaults to `false`

Example:

```xml
<plugins>
  <analytics>
    <provider>googleAnalytics</provider>
    <settings>
      <id>UA-XXXX</id>
      <anonymizeIp>true</anonymizeIp>
    </settings>
  </analyics>
</plugins>
```

## Google Analytics v4

The `provider` value must be set to `googleAnalytics`

- `id`: The tracking id that starts with `G-`
- `anonymizeIp`: Indicates if the IP address should be anonymized, defaults to `false`

Example:

```xml
<plugins>
  <analytics>
    <provider>googleAnalytics</provider>
    <settings>
      <id>G-XXXX</id>
    </settings>
  </analyics>
</plugins>
```

## Google Tag Manager

The `provider` value must be set to `googleTagManager`

- `id`: The container id that starts with `GTM-`

Example:

```xml
<plugins>
  <analytics>
    <provider>googleTagManager</provider>
    <settings>
      <id>GTM-XXXX</id>
    </settings>
  </analyics>
</plugins>
```

# Page Override

If the plugin is enabled in the site configuration but some pages should not include the analytics markup it is possible
to override the configuration using a field in the content-type:

| Field Type |  Field Name          |
|------------|----------------------|
| `checkbox` | `disableAnalytics_b` |

When the property is added to a content-type authors can use it do control which pages are excluded from analytics.

# Extending

Adding a new analytics provider is very simple:

## Add the new templates

Create all the required templates following the naming convention: `delivery/templates/{provider}/*`. The plugin will
automatically include the following templates:

| Name              | Description                                                             |
|-------------------|-------------------------------------------------------------------------|
| `definitions.ftl` | Can be used to define macros that will be available for other templates |
| `head.ftl`        | Can be used to inject markup in the head element                        |
| `body_top.ftl`    | Can be used to inject markup at the top of the body element             |
| `body_bottom.ftl` | Can be used to inject markup at the bottom of the body element          |

Example:

Assuming you are integrating a new service called `Custom Analytics`, you can create a template in the path
`delivery/templates/customAnalytics/head.ftl`:

```ftl
<#-- Get any required configuration -->
<#assign customKey = siteConfig.getString('plugins.analytics.settings.customKey')
<#assign customProp = siteConfig.getFloat('plugins.analytics.settings.customProp', 5)

<#-- Add the markup required by the service -->
<script src="https://www.customanalytics.com/script.js">
<script>
  customAnalytics.init('${customKey}', ${customProp})
</script>
```

Then it can be setup for the site like this:

```xml
<plugins>
  <analytics>
    <provider>customAnalytics</provider>
    <settings>
      <customKey>XXXX</customKey>
      <customProp>42</customProp>
    </settings>
  </analyics>
</plugins>
```
