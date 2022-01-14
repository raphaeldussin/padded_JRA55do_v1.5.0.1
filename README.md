# padded_JRA55do_v1.5.0.1

* install:

```
cd /archive/Raphael.Dussin/JRA55do/v1.5.0.1
git clone --recursive git@github.com:raphaeldussin/padded_JRA55do_v1.5.0.1.git padded
```

* pad files:

Create conda environment using the provided env file

```
conda create --name pad_jra --file conda_env
cond activate pad_jra
```

Then create the padded files

```
./pad_files_JRA55do_v1.5.0.1.bash
```

Optionally, you can create the files for 2019 to A/B test against JRA55do v1.5.0
