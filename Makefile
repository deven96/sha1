CROSS =
CXX   = $(CROSS)g++
RM    = rm -f
WORD=default


all: cpp_sha1 test_sha1 python_sha1

cpp_sha1: demo_sha1.cpp sha1.cpp sha1.hpp
	@$(CXX) -Wall -Wextra -std=c++11 -o $@ demo_sha1.cpp sha1.cpp
	@echo Encrypting $(WORD) using SHA1 written in CPP
	@./cpp_sha1 ${WORD}
	@make -s clean

cross_language:
	@make -s cpp_sha1
	@make -s python_sha1
	@make -s go_sha1
	@make -s javascript_sha1

python_sha1: 
	@echo Encrypting $(WORD) using SHA1 written in PYTHON
	@ ./sha1.py ${WORD} 

javascript_sha1:
	@echo Encrypting $(WORD) using SHA1 written in JAVASCRIPT
	@node demo_sha1.js ${WORD}

go_sha1:
	@echo Encrypting $(WORD) using SHA1 written in GOLANG
	@go run sha1.go $(WORD)

test_sha1: test_sha1.cpp sha1.cpp sha1.hpp
	$(CXX) -Wall -Wextra -std=c++11 -o $@ test_sha1.cpp sha1.cpp

check: test_sha1
	./test_sha1

clean:
	@$(RM) cpp_sha1 test_sha1