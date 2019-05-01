#!/bin/env python3

# dojjer python3 template

import os
import pwd


if __name__ == "__main__":
    print(pwd.getpwuid(os.getuid()).pw_name)

