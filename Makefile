.PHONY : log install_buck build watch message targets audit debug test xcode_tests clean project audit

# Local buck
BUCK=tools/buck

log:
	echo "Make"

setup:
	[ ! -d "tools" ] mkdir tools || echo "tools exists"
	cd App && bundle install

install_buck:
	curl https://jitpack.io/com/github/airbnb/buck/f2865fec86dbe982ce1f237494f10b65bce3d270/buck-f2865fec86dbe982ce1f237494f10b65bce3d270-java11.pex --output tools/buck
	chmod u+x tools/buck

project: clean
	cd App && xcodegen
	open App/BuckSample.xcworkspace

clean:
	rm -rf **/*.xcworkspace
	rm -rf **/*.xcodeproj
	$(BUCK) clean


buck_out = $(shell $(BUCK) root)/buck-out
TEST_BUNDLE = $(shell $(BUCK) targets //App:BuckSampleTests --show-output | awk '{ print $$2 }')
test:
	@rm -f $(buck_out)/tmp/*.profraw
	@rm -f $(buck_out)/gen/*.profdata
	$(BUCK) test //App:BuckSampleTests --test-runner-env XCTOOL_TEST_ENV_LLVM_PROFILE_FILE="$(buck_out)/tmp/code-%p.profraw%15x" \
		--config-file code_coverage.buckconfig
	xcrun llvm-profdata merge -sparse "$(buck_out)/tmp/code-"*.profraw -o "$(buck_out)/gen/Coverage.profdata"
	xcrun llvm-cov report "$(TEST_BUNDLE)/ExampleAppCITests" -instr-profile "$(buck_out)/gen/Coverage.profdata" -ignore-filename-regex "Pods|Carthage|buck-out"


build: 
	$(BUCK) build //App:App

debug:
	$(BUCK) install //App:App --run --simulator-name 'iPhone 8'