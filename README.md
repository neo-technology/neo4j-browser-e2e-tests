# neo4j-browser-e2e-tests

## Setup

```
npm install
```

## Running locally (single browser)

```
./run-local
```
or

```
./run-local <url_and_port>
```

## Running locally (against saucelabs)

Use your saucelabs account details:

```
export SAUCE_USERNAME=<saucelabs_username>
export SAUCE_ACCESS_KEY=<saucelabs_access_key>
```

To run against the default url and port
```
./run-sauce
```

To run against a different url or remotely hosted instance
```
./run-sauce <url>
```

## Running a ec2 instance against saucelabs

You will need:
- a copy of neo-workbench.jar and neo-workbench.sh on the local machine
- a local environment configured with your credentials

Use your saucelabs account details:

```
export SAUCE_USERNAME=<saucelabs_username>
export SAUCE_ACCESS_KEY=<saucelabs_access_key>
```

Then run
```
./run-ec2-tests.sh <dir_with_neo-workbench>
```
