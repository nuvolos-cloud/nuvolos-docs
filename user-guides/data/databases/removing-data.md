# Removing data

In Nuvolos, datasets and their tables are stored persistently and tracked within an **instance** across all its **snapshots**. This design ensures consistency and reproducibility, but it also means that data is **not automatically deleted** from storage when only removed from the current state.

**Key Concepts:**

* **Snapshots are immutable**: Once a snapshot is created, it preserves the state of the instance at that point in time. You cannot selectively modify or remove parts of a snapshot.
* **Shared data references**: Tables deleted in the current state may still be retained in older snapshots, which continue to reference the same underlying data.

{% hint style="danger" %}
Deleting a table from the current state alone does not free up storage space.

\
All snapshots that still reference the table must also be deleted to fully release the associated storage.
{% endhint %}

This is expected and intentional behavior in Nuvolos, ensuring that historical states remain intact unless explicitly removed.

**To fully delete a table and reclaim storage:**

1. **Delete the table in the current state**, _and_
2. **Delete all snapshots** that still contain the table.

Only once no references remain — in either the current state or any  snapshots — will the data be permanently removed from storage.

