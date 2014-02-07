PRODUCT=LiquidKit
PRODUCT_LOC=./build/
RELEASE_LOC=$(PRODUCT_LOC)/Release/
FRAMEWORK_INSTALL_LOC=/Library/Frameworks/

# Called before Xcode build. Xcode calls the Makefile with no args on build.
noop:

# Called before Xcode install. Builds if needed, and prompts for a password for framework installation.
install:
	xcodebuild -target LiquidKitFramework build
	osascript -e 'do shell script "cp -r $(RELEASE_LOC)$(PRODUCT).framework $(FRAMEWORK_INSTALL_LOC) &> /dev/null" with administrator privileges'

# Called before Xcode clean. Prompts for a password to remove framework.
clean:
	! test -e $(FRAMEWORK_INSTALL_LOC)$(PRODUCT).framework ||\
	  osascript -e 'do shell script "sudo rm -rf $(FRAMEWORK_INSTALL_LOC)$(PRODUCT).framework &> /dev/null" with administrator privileges'
