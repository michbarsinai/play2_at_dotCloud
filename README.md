<img src="http://www.playframework.org/assets/images/logos/normal.png" height="40px" />
<span style="font-size:3em">\_AT\_</span>
<img src="https://www.dotcloud.com/static/img/logo.png" height="40px"/>

Set of scripts allowing the dotCloud servers to run Play2 applications.


## What's This?
A set of scripts that allow running play2 applications on dotCloud servers, using java7.

Also, this is a work in progress and was tested only in Mac OS X. Contributions and test on other platforms are welcome!


## How to use
1. Copy the `play_at_dotcloud` folder to your play2 application directory (not to be confused with the `app` directory within that directory).
1. Connect the `play_at_dotcloud` folder to your dotcloud application

        dotcloud connect your_app_name

1. run the following command from your play2 app directory

        $ ./play2_at_dotcloud/build

## How It's Done
1. The `build` script creates a dist package using `play dist`.
1. The `build` script calls `dotcloud push --rsync` to push the distribution package to dotcloud's servers.
1. On the server, the `builder` script:
    1. Unpacks the dist package
    1. Moves the package to the home directory
    1. Installs java7 JRE in a `~/java7` (if needed).
1. The `run` script adds the java7 JRE to the path, and runs the play2 generated `start` script.

## Thanks
* mchv's play2 on dotcloud project (https://github.com/mchv/play2-on-dotcloud) (check it out for another approach to this).
* DotCloud support team

## Team
Michael Bar-Sinai (mich.barsinai@gmail.com)
