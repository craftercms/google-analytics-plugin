<#--
  ~ MIT License
  ~
  ~ Copyright (c) 2018-2021 Crafter Software Corporation. All Rights Reserved.
  ~
  ~ Permission is hereby granted, free of charge, to any person obtaining a copy
  ~ of this software and associated documentation files (the "Software"), to deal
  ~ in the Software without restriction, including without limitation the rights
  ~ to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  ~ copies of the Software, and to permit persons to whom the Software is
  ~ furnished to do so, subject to the following conditions:
  ~
  ~ The above copyright notice and this permission notice shall be included in all
  ~ copies or substantial portions of the Software.
  ~
  ~ THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  ~ IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  ~ FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  ~ AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  ~ LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  ~ OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  ~ SOFTWARE.
  -->

<#macro ifAnalyticsEnabled>
  <#-- Check if the plugin is enabled -->
  <#if siteConfig.getBoolean('plugins.analytics.enabled', !modePreview)>
    <#-- Check if the current item has the override property -->
    <#if (!(contentModel.disableAnalytics_b)!false) >
      <#-- Get the provider to use from the site configuration -->
      <#assign provider = siteConfig.getString('plugins.analytics.provider', 'noop')/>
      <#-- Execute the given markup -->
      <#nested/>
    </#if>
  </#if>
</#macro>

<@ifAnalyticsEnabled>
  <#-- If so include the markup for the given provider -->
  <#include "/templates/plugins/org/craftercms/plugin/analytics/" + provider + "/definitions.ftl" ignore_missing=true/>
</@ifAnalyticsEnabled>
