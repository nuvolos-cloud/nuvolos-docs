# I restored a snapshot by mistake

Restoring a snapshot will overwrite the contents of your current state with the contents of the snapshot being restored. When a snapshot is restored, Nuvolos automatically creates a backup snapshot of the current state before overwriting its content. Therefore, to revert a snapshot restoration operation, you can simply restore the backup snapshot that was automatically created after the first restoration operation.

For example, say you have a snapshot called _Snapshot1_ in your instance. By mistake, you restore _Snapshot1_, and two things happen:&#x20;

1. Nuvolos creates a backup snapshot of your current state with its existing content (suppose it's called _Snapshot1\_backup_), then
2. Nuvolos overwrites contents of the current state with the contents of _Snapshot1_.

If you have accidentally restored _Snapshot1_ and you want to revert this operation, you can restore _Snapshot1\_backup_ which will again overwrite the contents of the current state with what it had before the first snapshot restoration was performed.
