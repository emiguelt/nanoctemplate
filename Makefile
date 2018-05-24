OUTPUT=./output
SITEDIR=<your site dir path>
COMMENT=$(shell git log -1 --oneline)
co:
	nanoc co
	cp -r ./static/* $(OUTPUT)/ -u

clean:
	rm -rf $(OUTPUT)
	rm -rf ./tmp

deploy: clean	co
	cp -r $(OUTPUT)/* $(SITEDIR)/
	cd $(SITEDIR)/;\
	echo $(COMMENT);\
	git add .;\
	git commit -m "$(COMMENT)";\
	git push origin master

guard:
	bundle exec nanoc live

