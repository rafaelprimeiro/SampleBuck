BUCK=tools/buck

setup:
	[ ! -d "tools" ] mkdir tools || echo "tools exists"
	bundle install
	xcodegen

install_buck:
	curl https://jitpack.io/com/github/airbnb/buck/f2865fec86dbe982ce1f237494f10b65bce3d270/buck-f2865fec86dbe982ce1f237494f10b65bce3d270-java11.pex --output tools/buck
	chmod u+x tools/buck
