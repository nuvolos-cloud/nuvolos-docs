# Programmatical assignment handling

{% hint style="warning" %}
This is a new and experimentary feature of Nuvolos, please provide us with feedback to make it better!
{% endhint %}

It is possible to collect assignments from a project using a command line tool currently available in applications from our support on request.

The name of the tool is `nvcollect` and it is intended to help you in programmatically collecting and handing back grading artfiacts.

## Prerequisites

For the following example, please work in the Master (instructor's) instance.

Add a JupyterLab + TexLive application to the Master instance. This application will be used to grade the students' submissions with `otter-grader.`

## Installation

To install `nvcollect`, run the following command from the terminal in your JupyterLab application:

```bash
pip install --upgrade git+https://github.com/alphacruncher/nv-collect
```

## Basic usage

The tool makes it possible to:

1. Collect assignments from all students to a folder in your instance.
2. Grade assignments using the `otter-grader` package if your project supports this.
3. Hand back assignments in a safe manner to all students with a single command.

## A tutorial workflow integrated with Otter

This guide relies on using the `otter-grader` package and demonstrates how the otter tutorial found [here](https://otter-grader.readthedocs.io/en/latest/tutorial.html) can be adapted to the Nuvolos workflow. This package requires TexLive to function properly which is only available currently on request from our support.

In the guide we assume the following:

* You have access to a JupyterLab image that supports TexLive, `pandoc`, `otter-grader` and you have installed `nv-collect`.

### Obtain the otter tutorial

To get the files referred by the otter tutorial, open a JupyterLab terminal and hit

```
wget https://otter-grader.readthedocs.io/en/latest/_static/tutorial.zip
unzip tutorial.zip
```

### Modify `demo.ipynb`

The `demo.ipynb` file that is provided by `otter-grader` is not completely compatible with Nuvolos. The reason is that the demo assumes that the environment has a window system - this is not true in Nuvolos. In order to fix this issue, in the second cell  instead of

```
%matplotlib inline
```

make sure to have

```
import matplotlib
matplotlib.use('Agg')
```

### Run `otter assign`

Following the steps of the tutorial execute the following command in the directory where you unzipped the tutorial zipfile:

```
otter assign demo.ipynb dist --v1
```

This command creates a `dist` directory in which the artifacts required for the autograding and assignment distribution are added.

The `dist/student/demo.ipynb` file is the stripped-down, simplified, user-friendly file that your students will have to fill out.

### Create an Assignment on Nuvolos

Please refer to our [guide](./#creating-an-assignment) on creating assignments. Make sure to copy `dist/student/demo.ipynb` to some separate folder which you can safely stage and assign.

In our example, we copy the file from `/files/otter-test/dist/student/demo.ipynb` to `/files/assignment_1/demo.ipynb`, then we stage the entire folder and distribute it as an assignment to our students. We give the assignment the name "assignment\_1" in Nuvolos when creating the assignment (this doesn't have to be the same as the folder name containing the assignment, but it is generally good practice to have the same).&#x20;

### Collect hand-ins

Once the assignment deadline has passed, the assignments are ready to be collected. We use the following command available in the JupyterLab terminal to collect:

```
nvcollect collect --assignment_name "assignment_1" --assignment_folder assignment_1 --target_folder /files/test_collect
```

This tells the collect tool to gather from all students whatever is contained in the `assignment_1` folder in the Nuvolos assignment called "assignment\_1" and the collected files should be placed under `/files/test_collect`.

The directory structure will be as such:

```
/files/test_collect
+-- nvcollect_manifest.json
+-- single_user_inst_<code1>
|   +-- ...
+-- single_user_inst_<code2>
|   +-- ...
```

### Grade hand-ins



In order to grade hand-ins we need to use the `autograder.zip` file generated in Step 3. To grade all collected assignments:

```
nvcollect otter-grade --source_folder /files/test_collect --autograder_location /files/otter-test/dist/autograder/autograder.zip --relative_path demo.ipynb
```

Observe the following:

* `source_folder` is the same folder as provided as `target_folder` to the collection command.
* You have to provide the absolute path of the `autograder.zip` file that belongs to the particular notebook file you want to grade.
* The `relative_path` parameter tells the tool where to look for in each student submission directory for the notebook file that needs to be graded.

As an outcome of the grading, you get the following new items in the `source_folder`:

* A `grade.csv` file which contains the score of each student.
* A `grade.csv` file in each student folder which contains the score of the student.

### Handing back

You might want to add additional artifacts to each students folders (either manually or programmatically). Once you are done with this, you can push back the results of the grading with the command

```
nvcollect handback --source_folder /files/test_collect
```

* Notice that the `source_folder` here is the same folder to which we collected and then in which the grading process ran.
