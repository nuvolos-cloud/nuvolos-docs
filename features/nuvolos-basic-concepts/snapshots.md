# Snapshots

## What are snapshots?

Snapshots are a key feature of Nuvolos. Snapshotting creates a _complete, immutable, persistent, restorable, and shareable_ copy of the current state of your workflow:

* _Complete_ because Nuvolos ensures that the copy of the current [state of your instance](broken-reference) is complete. This means that your files, database tables, application data, and application setting and dependencies all get saved as a single unit.
* _Immutable_ because the copy is read-only, and cannot be modified after the fact. This means it is secure and you will always know what it contains.
* _Persistent_ because the snapshot is always available, unless either the project is deleted or the Nuvolos subscription ended.
* _Restorable_ because a user can use a snapshot to restore the previous state of an instance integrally. This save-and-restore process is one of the primary benefits of the snapshot feature, since it means you can at any time experiment, save the entirety of the work setup in one go, and try again in a different way, without fear of losing any component of the work.
* _Shareable_, because the snapshots can themselves be [distributed](distribution.md) using Nuvolos, for example to a colleague or a student. This ability to share entire workflows in a containerised manner is the other major benefit of the snapshot feature.

Snapshotting is a key component to speeding up the dissemination of scientific results, and guarantees version control on all of the artefacts of research: code, data, and applications.

## Snapshot use cases

Here are some example use cases where the Nuvolos snapshot feature may come in handy:

### Guaranteeing research reproducibility

One of Nuvolos' goals is to help the scientific community advance towards an era of completely reproducible research. By creating a snapshot of your work, you can be sure that your code will produce the exact same results, no matter who runs it. This is very practical for sharing with colleagues or referees, and for meeting contemporary standards for code and data sharing in order to be accepted for publication.

### Setting up a course

You can set up a course by first building and testing your material. Once you are done, you can create a snapshot and then distribute this snapshot to all students taking the course with you. The students will receive the entire computing environment just as you have set it up, so they can get to work immediately. You will know for sure exactly what kind of working environment they will have, and that they will all have the same one.

### Onboarding a new member to a research project

Once the new research project members are invited to Nuvolos, you can distribute the current state of your project to them and they can get going directly, without the need to spend valuable time worrying about setting up their infrastructure just the right way.

### Creating an audit trail for assignments

Students also have the ability to take snapshots of their work. A snapshot is always time-stamped and greatly simplifies handing in of assignments. The student does not need to worry whether their work is reproducible by the instructor, and the instructor does not have to worry about managing a myriad of separate files and e-mails sent by students.&#x20;
