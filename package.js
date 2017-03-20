Package.describe({
  name: 'rgnevashev:stripe',
  version: '4.4.0_2',
  summary: 'Stripe API wrapper',
  git: 'https://github.com/stripe/stripe-node.git',
  documentation: 'README.md'
});

Npm.depends({ "stripe": "4.4.0" });

Package.onUse(function(api) {
  api.versionsFrom('1.2.1');

  api.use(['templating','underscore','coffeescript']);

  api.addFiles('client/body.html', 'client');
  api.addFiles('server/stripe.coffee', 'server');

  api.export(['StripeApi','StripeSync'], 'server');
});
