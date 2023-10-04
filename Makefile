BREWDIR:=/Users/plotfi/opt/homebrew/

all:
	swiftc Box2DHello.swift -o Box2DHello.exe -Xcc -std=c++17 \
	-cxx-interoperability-mode=default -Xcc -fno-exceptions \
	-Xcc -fignore-exceptions \
	-I./box2dTypeConvert \
	-I$(BREWDIR)/include/ \
	-L$(BREWDIR)/lib/ -lbox2d

clean:
	rm Box2DHello.exe
