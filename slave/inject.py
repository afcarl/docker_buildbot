import sys
assert(len(sys.argv) == 2)
with open('Dockerfile.input','r') as fp:
    df = fp.read()
with open('Dockerfile','w') as fp:
    fp.write(df.format(IP = sys.argv[1]))