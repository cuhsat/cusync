# rsync
RSYNC=$(shell which rsync)

# rsync files
RSYNC_LOG=.rsync/log
RSYNC_IGNORE=.rsync/ignore
RSYNC_BACKUP=.rsync/backup/$(shell date +\%Y-\%m-\%d)

# rsync arguments
RSYNC_PATH=.
RSYNC_HOST=<YOUR SERVER HERE>
RSYNC_ARGS=-azhuP --rsh=ssh --stats --delete-before --exclude-from=$(RSYNC_IGNORE) --backup --backup-dir=$(RSYNC_BACKUP)

# rsync commands
get :
	@$(RSYNC) $(RSYNC_ARGS) $(RSYNC_HOST) $(RSYNC_PATH) >> $(RSYNC_LOG)

put :
	@$(RSYNC) $(RSYNC_ARGS) $(RSYNC_PATH) $(RSYNC_HOST) >> $(RSYNC_LOG)

sync : get put
