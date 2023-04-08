/**
 * Source of https://webscraper.io/test-sites/tables for stable testing
 */
export const html = /* html */ `

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Google Tag Manager -->
<script>(function (w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start':
				new Date().getTime(), event: 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0],
			j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
		j.async = true;
		j.src =
			'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-NVFPDWB');</script>
<!-- End Google Tag Manager -->
	<title>Web Scraper Test Sites</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<meta name="keywords"
		  content="web scraping,Web Scraper,Chrome extension,Crawling,Cross platform scraper"/>
	<meta name="description"
		  content="The most popular web scraping extension. Start scraping in minutes. Automate your tasks with our Cloud Scraper. No software to download, no coding needed."/>
	<link rel="icon" sizes="128x128" href="/favicon.png">

	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<link rel="stylesheet" href="/css/app.css?id=ed0b76b9bc27b6c8a72298dc6c494781">

	<link rel="canonical" href="https://webscraper.io/test-sites/tables">
	<link rel="apple-touch-icon" href="/img/logo-icon.png">

		<script defer src="/js/app.js?id=d2e2345e7d04a28ba94540a683bf36c4"></script>

	
</head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript>
	<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NVFPDWB"
	        height="0" width="0" style="display:none;visibility:hidden"></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
<header role="banner" class="navbar navbar-fixed-top navbar-static">
	<div class="container">

		<div class="navbar-header">

			<a data-toggle="collapse-side" data-target=".side-collapse" data-target-2=".side-collapse-container">
				<button type="button" class="navbar-toggle pull-right collapsed" data-toggle="collapse"
						data-target="#navbar" data-target-2=".side-collapse-container" data-target-3=".side-collapse"
						aria-expanded="false" aria-controls="navbar">

					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar top-bar"></span>
					<span class="icon-bar middle-bar"></span>
					<span class="icon-bar bottom-bar"></span>

				</button>
			</a>
			<div class="navbar-brand">
				<a href="/"><img src="/img/logo_white.svg" alt="Web Scraper"></a>
			</div>
		</div>

		<div class="side-collapse in">
			<nav id="navbar" role="navigation" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="hidden">
						<a href="#page-top"></a>
					</li>
					
					
					
					
					
					
					<li>
						<a href="/" class="menuitm">
							<p>Web Scraper</p>
							<div class="crta"></div>
						</a>
					</li>
					<li>
						<a href="/cloud-scraper" class="menuitm">
							<p>Cloud Scraper</p>
							<div class="crta"></div>
						</a>
					</li>
					<li>
						<a href="/pricing" class="menuitm">
							<p>Pricing</p>
							<div class="crta"></div>
						</a>
					</li>

					
					
					
					
					
					
					
					
					
					<li class="dropdown">
						<a href="#section3" class="menuitm dropdown-toggle" data-toggle="dropdown">
							<p>Learn</p>
							<div class="crta"></div>
						</a>
						<ul class="dropdown-menu">
							<li>
								<a href="/documentation">Documentation</a>
							</li>
							<li>
								<a href="/tutorials">Video Tutorials</a>
							</li>
							<li>
								<a href="/how-to-videos">How to</a>
							</li>
							<li>
								<a href="/test-sites">Test Sites</a>
							</li>
							<li>
								<a href="https://forum.webscraper.io/" target="_blank" rel="noopener">Forum</a>
							</li>
						</ul>
					</li>
					<li>
						<a target="_blank" href="https://chrome.google.com/webstore/detail/web-scraper/jnhgnonknehpejjnehehllkliplmbmhn?hl=en" class="btn-menu1 install-extension" rel="noopener">Install</a>
					</li>
					<li>
						<a href="https://cloud.webscraper.io/" class="btn-menu2">Login</a>
					</li>
				</ul>
			</nav>
		</div>
	</div>
</header>

<div class="wrapper">
	
	<div class="formenu-here container-fluid">

	</div>
	<div class="container-fluid blog-hero">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>Table playground</h1>
				</div>
			</div>
		</div>
	</div>

	<div class="container">

		<p>
			You can train using Table selector here.
		</p>
		<hr>

		<h2>Semantically correct table with thead and tbody</h2>
		<p>
			Table selector automatically detects header and data rows.
		</p>

		<table class="table table-bordered">
			<thead>
			<tr>
				<th>#</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>1</td>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
			</tbody>
		</table>

		<table class="table table-bordered">
			<thead>
			<tr>
				<th>#</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>4</td>
				<td>Harry</td>
				<td>Potter</td>
				<td>@hp</td>
			</tr>
			<tr>
				<td>5</td>
				<td>John</td>
				<td>Snow</td>
				<td>@dunno</td>
			</tr>
			<tr>
				<td>6</td>
				<td>Tim</td>
				<td>Bean</td>
				<td>@timbean</td>
			</tr>
			</tbody>
		</table>

		<hr>

		<h2>Table without thead tag</h2>
		<p>
			Table selector automatically detects header and data rows.
		</p>

		<table class="table table-bordered">
			<tbody>
			<tr>
				<th>#</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
			</tr>
			<tr>
				<td>1</td>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
			</tbody>
		</table>

		<h2>Table with multiple header rows and an empty data row</h2>
		<p>
			You must manually select header and data rows.
		</p>

		<table class="table table-bordered">
			<tbody>
			<tr>
				<th></th>
				<th colspan="2">Person</th>
				<th>User data</th>
			</tr>
			<tr>
				<th>#</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Username</th>
			</tr>
			<tr>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
			<tr>
				<td>1</td>
				<td>Mark</td>
				<td>Otto</td>
				<td>@mdo</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Jacob</td>
				<td>Thornton</td>
				<td>@fat</td>
			</tr>
			<tr>
				<td>3</td>
				<td>Larry</td>
				<td>the Bird</td>
				<td>@twitter</td>
			</tr>
			</tbody>
		</table>

	</div>

	<div class="clearfix"></div>
	<div class="push"></div>
</div>

<div class="container-fluid footer" id="layout-footer">
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<ul>
					<li><p>Products</p></li>
					<li>
						<a href="/">Web Scraper browser extension</a>
					</li>
					<li>
						<a href="/pricing">Web Scraper Cloud</a>
					</li>
					
					
				</ul>
			</div>
			<div class="col-md-3">
				<ul>
					<li><p>Company</p></li>
					
					<li><a href="/contact">Contact</a>
					</li>
					
					<li>
						<a href="/privacy-policy">Website Privacy Policy</a>
					</li>
					<li>
						<a href="/extension-privacy-policy">Browser Extension Privacy Policy</a>
					</li>
					<li>
						<a href="https://webscraper.io/downloads/Web_Scraper_Media_Kit.zip">Media kit</a>
					</li>
					
					<li><a href="/jobs">Jobs</a></li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul>
					<li><p>Resources</p></li>
					<li><a href="/blog">Blog</a></li>
					<li>
						<a href="/documentation">Documentation</a>
					</li>
					<li>
						<a href="/tutorials">Video Tutorials</a>
					</li>
					<li>
						<a href="/screenshots">Screenshots</a>
					</li>
					<li>
						<a href="/test-sites">Test Sites</a>
					</li>
					<li>
						<a target="_blank" href="https://forum.webscraper.io/" rel="noopener">Forum</a>
					</li>
				</ul>
			</div>
			<div class="col-md-3">
				<ul>
					<li><p>CONTACT US</p></li>
					<li>
						<a href="mailto:info@webscraper.io">info@webscraper.io</a>
					</li>
					
					<li>Rupniecibas iela 30,<br> Riga, Latvia, LV-1045</li>
				</ul>
				<ul class="smedia">
					<li>
						<a href="https://www.facebook.com/webscraperio/" target="_blank" rel="noopener"><img src="/img/fbicon.png" alt="Web Scraper on Facebook"></a>
					</li>
					<li>
						<a href="https://twitter.com/webscraperio" target="_blank" rel="noopener"><img src="/img/twicon.png" alt="Web Scraper on Twitter"></a>
					</li>
					

				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<p class="copyright">Copyright &copy 2023
					<a href="#">Web Scraper</a> | All rights
					reserved | Made by zoom59</p>
			</div>
		</div>
	</div>
</div>


</body>
</html>
`;