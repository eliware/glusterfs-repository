# Eliware GlusterFS package repository

This repository is the complete, published package repository for Eliware's
GlusterFS builds. It contains RPM and DEB packages together with repository
indexes, checksums, release metadata, provenance records, validation evidence,
and build logs.

The repository is consumed by the read-only HTTP service in
[`eliware/gluster-http`](https://github.com/eliware/gluster-http). The package
build and release pipeline is maintained in
[`eliware/glusterfs-packaging`](https://github.com/eliware/glusterfs-packaging).
This repository is publication data, not the package build source.

## Published repositories

Stable repositories:

```text
https://glusterfs.eliware.org/el10/x86_64/stable/
https://glusterfs.eliware.org/debian/bookworm/amd64/stable/
https://glusterfs.eliware.org/ubuntu/noble/amd64/stable/
```

Rolling and preview repositories are published below the corresponding
`previews/<release-id>/` path. Use the release catalog and repository metadata
to select a specific preview rather than relying on a mutable directory name.

## Repository layout

```text
debian/                 Debian repository indexes and packages
el10/                   EL10-compatible RPM repositories
ubuntu/                 Ubuntu repository indexes and packages
keys/                   Public package-signing keys
content/                Published supporting content
metadata/               Catalogs, manifests, provenance, and validation
.generations/           Immutable publication generations and build evidence
glusterfs-el10.repo     RPM repository configuration example
```

The public tree also exposes stable and preview paths as links into immutable
publication generations. A generation contains the packages and the metadata
that describe and validate that exact publication.

## Integrity and provenance

Before consuming packages, verify repository metadata and package signatures
with the public key at:

```text
https://glusterfs.eliware.org/keys/RPM-GPG-KEY-ELIWARE-GLUSTER
```

Use the checksums, signed metadata, provenance records, release manifests, and
validation records shipped beside each release to establish which source
revision and build inputs produced an artifact. Immutable digests and release
identifiers are preferred for reproducible deployments.

The repository intentionally retains build and validation logs. They are part
of the release evidence and may contain normal public build metadata, such as
package maintainer or signing addresses. They must not be treated as a source
of credentials or private deployment configuration.

## Package consumers

For RPM consumers, import the public signing key, configure the appropriate
EL10 repository, and use the repository's signed metadata through the normal
DNF workflow. For Debian and Ubuntu consumers, configure the matching
distribution and architecture path and follow the APT signature configuration
provided by the published repository metadata.

Choose a repository matching the target distribution and architecture. Do not
mix EL10, Debian, and Ubuntu packages or use a rolling preview in production
without deliberate validation.

## Release ownership

The packaging repository is the source of truth for build configuration,
package contents, metadata contracts, signing, validation, and publication.
The HTTP service serves this tree and does not build or mutate release data.
Changes to packages or release metadata must therefore be made through the
packaging and publication workflow rather than by editing published files
manually.

## Licensing

See [`LICENSE`](LICENSE) for the collection-level licensing notice. Original
Eliware repository material is Apache-2.0 unless otherwise marked. GlusterFS,
third-party packages, and generated artifacts retain their applicable
upstream licenses and notices; the collection-level notice does not relicense
them.

The upstream GlusterFS project is available at
[`gluster/glusterfs`](https://github.com/gluster/glusterfs), and its source
license notices accompany the applicable source and binary packages.

## Related projects

- [Package builds and release pipeline](https://github.com/eliware/glusterfs-packaging)
- [Repository HTTP service](https://github.com/eliware/gluster-http)
- [GlusterFS storage console](https://github.com/eliware/gluster)
- [GlusterFS test cluster](https://github.com/eliware/glusterfs-test-cluster)
- [Official GlusterFS project](https://www.gluster.org/)
- [GlusterFS documentation](https://docs.gluster.org/)

