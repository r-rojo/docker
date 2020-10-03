import argparse
import sys
import subprocess

def get_dnf_cmd(packages):
    if packages:
        return f'RUN dnf install -y {" ".join(packages)}'
    return ''

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('-o', '--output',
                        type=argparse.FileType('w+'), default=sys.stdout)
    args = parser.parse_args()
    with open('all_packages.txt', 'r') as fp:
        all_packages = [l.strip() for l in fp if not l.startswith('#')]
    current_packages = []
    with open('Docker.f32.in', 'r') as fp:
        tmpl = fp.read()

    while True and all_packages:
        with open('Docker.f32.out', 'w') as out:
            out.write(tmpl.format(packages=get_dnf_cmd(current_packages)))
        cmd = ['docker', 'build', '.', '-f', 'Docker.f32.out', '-t' 'f32:opae-libs']
        if not subprocess.run(cmd).returncode:
            args.output.write('\n'.join(current_packages))
            break
        current_packages.append(all_packages.pop(0))
    


if __name__ == '__main__':
    main()