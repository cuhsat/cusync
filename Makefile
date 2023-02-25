# rsync
RSYNC=$(shell which rsync)

# rsync files
RSYNC_LOG=.rsync/log
RSYNC_IGNORE=.rsync/ignore
RSYNC_BACKUP=.rsync/backup

# rsync arguments
RSYNC_PATH=.
RSYNC_HOST=<YOUR SERVER HERE>
RSYNC_ARGS=-azhuP --rsh=ssh --stats --delete-before --exclude-from=$(RSYNC_IGNORE) --backup --backup-dir=$(RSYNC_BACKUP)/$(shell date +\%Y-\%m-\%d)

# rsync commands
purge :
	@rm -rf	$(RSYNC_BACKUP)/*

pull :
	@$(RSYNC) $(RSYNC_ARGS) $(RSYNC_HOST) $(RSYNC_PATH) >> $(RSYNC_LOG)

push :
	@$(RSYNC) $(RSYNC_ARGS) $(RSYNC_PATH) $(RSYNC_HOST) >> $(RSYNC_LOG)

sync : pull push
