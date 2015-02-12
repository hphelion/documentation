---
layout: default-devplatform
permalink: /als/v1/user/deploy/languages/dotnet/
published: false
title: "Developing In .NET"
---
<!--PUBLISHED-->

# HP Helion 1.0 Development Platform: Developing In .NET

.NET applications can be built to communicate directly with the <a class="reference external" href="http://docs.hpcloud.com/api">Helion APIs</a> through a REST client
or through the SDK. The SDK simplifies working with the REST services by providing easy to use APIs.</p>
<p>Here is an example of writing and reading from object storage:</p>
<div class="highlight-csharp"><div class="highlight"><pre><span class="c1">//Setup and create a credential to use when connecting to OpenStack</span>
<span class="n">var</span> <span class="n">authUri</span> <span class="p">=</span> <span class="k">new</span> <span class="n">Uri</span><span class="p">(</span><span class="s">&quot;https://region.identity.host.com:12345/v2.0&quot;</span><span class="p">);</span>
<span class="n">var</span> <span class="n">userName</span> <span class="p">=</span> <span class="s">&quot;user name&quot;</span><span class="p">;</span>
<span class="n">var</span> <span class="n">password</span> <span class="p">=</span> <span class="s">&quot;password&quot;</span><span class="p">;</span>
<span class="n">var</span> <span class="n">tenantId</span> <span class="p">=</span> <span class="s">&quot;XXXXXXXXXXXXXX-Project&quot;</span><span class="p">;</span>
<span class="n">var</span> <span class="n">credential</span> <span class="p">=</span> <span class="k">new</span> <span class="n">OpenStackCredential</span><span class="p">(</span><span class="n">authUri</span><span class="p">,</span> <span class="n">userName</span><span class="p">,</span> <span class="n">password</span><span class="p">,</span> <span class="n">tenantId</span><span class="p">);</span>

<span class="c1">//Create and connect a new client for working with OpenStack</span>
<span class="n">var</span> <span class="n">client</span> <span class="p">=</span> <span class="n">OpenStackClientFactory</span><span class="p">.</span><span class="n">CreateClient</span><span class="p">(</span><span class="n">credential</span><span class="p">);</span>
<span class="n">await</span> <span class="n">client</span><span class="p">.</span><span class="n">Connect</span><span class="p">();</span>

<span class="c1">//Create a service client for working with the Swift storage service</span>
<span class="n">var</span> <span class="n">storageServiceClient</span> <span class="p">=</span> <span class="n">client</span><span class="p">.</span><span class="n">CreateServiceClient</span><span class="p">&lt;</span><span class="n">IStorageServiceClient</span><span class="p">&gt;();</span>

<span class="c1">//Get the default account, and print out all of its containers</span>
<span class="n">var</span> <span class="n">storageAccount</span> <span class="p">=</span> <span class="n">await</span> <span class="n">storageServiceClient</span><span class="p">.</span><span class="n">GetStorageAccount</span><span class="p">();</span>
<span class="k">foreach</span><span class="p">(</span><span class="n">var</span> <span class="n">container</span> <span class="k">in</span> <span class="n">storageAccount</span><span class="p">.</span><span class="n">Containers</span><span class="p">)</span>
<span class="p">{</span>
    <span class="n">Console</span><span class="p">.</span><span class="n">WriteLine</span><span class="p">(</span><span class="n">container</span><span class="p">.</span><span class="n">Name</span><span class="p">);</span>
<span class="p">}</span>
</pre></div>
</div>

To learn more about using the SDK:
- 
- [Getting Started With The .NET Library](/als/v1/user/deploy/languages/dotnet/getstarted)
- [Identity Service, Authentication, and the Service Catalog in .NET](/als/v1/user/deploy/languages/dotnet/authentication)
- [Working With Object Storage in .NET](/als/v1/user/deploy/languages/dotnet/objectstore)


##HP Helion PowerShell Environment
The HP Helion PowerShell Environment allows users to manage storage, compute, and block storage services from the [Windows PowerShell Environment](https://docs.hpcloud.com/cli/)


