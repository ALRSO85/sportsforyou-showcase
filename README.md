# SportsForYou — technical overview

[Visit SportsForYou](https://sportsforyou.com.br/)

SportsForYou brings together athletes, events, communities, organizers, partners and brands. I am responsible for the product design, architecture and implementation. The web application contains the business modules; asynchronous jobs run in a separate .NET Worker.

## Background processing

The `Sport.Worker.JobCenter` runs separately from the web application. It has its own container and health check in Docker Compose, so the worker can be deployed and monitored on its own. The [architecture map](docs/architecture-map.md) and [architecture overview](docs/architecture.md) show how it fits into the platform.

## Stack and delivery

The application uses C#, .NET 10, ASP.NET Core MVC and Razor, with SQL Server in production. Docker Compose runs on Ubuntu Server; Cloudflare Tunnel handles ingress and Azure Pipelines handles delivery. Quality checks include xUnit v3, Playwright and axe-core for the documented accessibility scope. The security controls represented in the code include ASP.NET Core authentication, OpenID Connect, JWT, antiforgery, Content Security Policy, rate limiting and persistent Data Protection. The [technology stack document](docs/technology-stack.md) records their scope.

## More detail

- [Modules](docs/modules.md)
- [Quality gates and automation](docs/quality-gates.md)
- [Frontend, SEO and accessibility](docs/frontend-seo-accessibility.md)
- [Database governance](docs/database-governance.md)
- [Sanitized code and quality samples](samples/)

## About this repository

This repository contains a technical overview and sanitized examples, not the full product source. It excludes credentials, customer data, private endpoints and production configuration.
