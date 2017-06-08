#!/bin/bash
set -eux

. "$(dirname "$(readlink -f "$0")")"/functions.sh

# Puppet manifests
CONCAT_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/puppetlabs-concat-1.2.4.tar.gz"
STDLIB_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/puppetlabs-stdlib-4.7.0.tar.gz"
ELASTICSEARCH_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/elasticsearch-elasticsearch-0.10.1.tar.gz"
# Dependency for Elasticsearch 0.10.x
DATACAT_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/richardc-datacat-0.6.2.tar.gz"
FIREWALL_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/puppetlabs-firewall-1.7.2.tar.gz"
APACHE_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/puppetlabs-apache-1.4.0.tar.gz"
HTPASSWD_TARBALL_URL="https://forgeapi.puppetlabs.com/v3/files/leinaddm-htpasswd-0.0.3.tar.gz"


# Install puppet manifests
download_puppet_module "concat" "$CONCAT_TARBALL_URL"
download_puppet_module "stdlib" "$STDLIB_TARBALL_URL"
download_puppet_module "elasticsearch" "$ELASTICSEARCH_TARBALL_URL"
download_puppet_module "firewall" "$FIREWALL_TARBALL_URL"
download_puppet_module "datacat" "$DATACAT_TARBALL_URL"
download_puppet_module "apache" "${APACHE_TARBALL_URL}"
download_puppet_module "htpasswd" "${HTPASSWD_TARBALL_URL}"

