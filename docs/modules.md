# Estrutura da solução

O SportsForYou é organizado como um monólito modular. A aplicação web fica em `Sport.UI`, enquanto os projetos de domínio ficam sob `Sport.API.Domain` e as bibliotecas compartilhadas, sob `Sport.Framework`.

Entre os projetos de domínio estão Athlete, Coach, Event, Finance, Integration, Notification, Organizer, Payment, Report, Store, Team e Training. Esses nomes correspondem à estrutura da solução; eles não representam serviços implantados separadamente.

O processamento em segundo plano roda no `Sport.Worker.JobCenter`, um .NET Worker com container e health check próprios. A separação entre o worker e a aplicação web é operacional; os domínios continuam agrupados na aplicação principal.

Os testes também estão organizados por área. A solução inclui, por exemplo, `Sport.API.Domain.Event.Tests` e `Sport.UI.Tests`.
