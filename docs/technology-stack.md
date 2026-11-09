# Technology Stack — SportsForYou

This page describes technologies documented in the SportsForYou codebase. It is not a complete list of the author's professional experience, and it does not imply that every compatible provider or tool is active in production.

## Application

- C# and .NET 10 with ASP.NET Core MVC and Razor Views.
- Modular monolith, with business modules in separate projects.
- A .NET Worker/Generic Host runs JobCenter background processing.

## Data and integrations

- SQL Server is the production provider configured by the application.
- MySQL dialect support is retained for compatible scenarios and abstraction tests; it is not described here as the production database.
- Integrations include HTTP clients, Google Drive API and AWS S3 through the documented file-storage modules.

## User interface

- Razor, JavaScript and Bootstrap 5.3.8.
- jQuery 3.7.1 and jQuery Validation support existing form flows.
- Font Awesome Free 7.3.1 provides icons.

## Delivery and quality

- Docker and Docker Compose package the web application and background worker for hosting on Ubuntu Server; Cloudflare Tunnel provides the documented ingress path.
- Azure Pipelines run restore, build, tests and project quality checks.
- xUnit v3 is used for .NET tests; Playwright and axe-core cover browser and automated accessibility checks.
- PowerShell and Bash scripts support controlled deployment, health checks and release validation.

## Security capabilities represented in the codebase

- ASP.NET Core authentication, Google Authentication, OpenID Connect and JWT where applicable.
- Antiforgery protection, Content Security Policy, rate limiting and persistent Data Protection.

Automated accessibility checks cover only their implemented rules; they do not establish full WCAG conformance. Recheck this inventory against the source when the product stack changes.
