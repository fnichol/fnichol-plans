pkg_name=comcast
pkg_origin=fnichol
pkg_version=1.0.1
pkg_maintainer="Fletcher Nichol <fnichol@nichol.ca>"
pkg_license=('Apache-2.0')
pkg_description="Simulating shitty network connections so you can build better systems."
pkg_source=https://github.com/tylertreat/comcast/archive/v1.0.1.tar.gz
pkg_shasum=d1ca7177314fc419bf3e10a33e09d582674bd59a5c3ec427ed56f5d8b1ddb2c8
pkg_bin_dirs=(bin)
pkg_build_deps=(core/git core/go)
pkg_deps=()

do_prepare() {
  export GOPATH=$HAB_CACHE_SRC_PATH
  export CGO_ENABLED=0
}

do_build() {
  go get github.com/tylertreat/comcast/throttler
  go build -x
}

do_install() {
  install -v -D "${pkg_name}-${pkg_version}" "${pkg_prefix}/bin/${pkg_name}"
}
