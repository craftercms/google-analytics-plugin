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

<#-- Check if the plugin is enabled -->
<#if pluginConfig.getBoolean('enabled', !modePreview)>
  <#-- Check if the current item has the override property -->
  <#if (!(contentModel.disableGoogleAnalytics_b)!false) >
    <#assign id = pluginConfig.getString('id') />
    <#assign anonymizeIp = pluginConfig.getBoolean('anonymizeIp', false) />

    <#if id?starts_with('UA-')>
      <!-- Google Analytics -->
      <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', '${id}', 'auto');
      ga('set', 'anonymizeIp', ${anonymizeIp?c});
      ga('send', 'pageview');
      </script>
      <!-- End Google Analytics -->
    <#elseif id?starts_with('G-')>
      <!-- Global site tag (gtag.js) - Google Analytics -->
      <script async src="https://www.googletagmanager.com/gtag/js?id=${id}"></script>
      <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){window.dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', '${id}', { 'anonymize_ip': ${anonymizeIp?c} });
      </script>
    </#if>
  </#if>
</#if>
