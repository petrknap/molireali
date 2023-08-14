#!/usr/bin/env python3
import argparse
import json
import re


def camel_case_to_dashed(string: str) -> str:
    return '-'.join(
        # See https://www.geeksforgeeks.org/python-split-camelcase-string-to-individual-strings/
        re.findall(r'[A-Z](?:[a-z]+|[A-Z]*(?=[A-Z]|$))', string)
    ).lower()


def update_composer_file(path: str, namespace: str, php_version: str, license_shortcut: str, short_description: str) -> None:
    name = namespace.split('\\', 1)
    with open(path, 'r+') as file:
        content = file.read()
        data = json.loads(content)
        data_require = data.get('require', {})
        data_require.update({'php': f'>={php_version}'})
        data = {
            'WARNING': 'This file is updated automatically. All keys will be overwritten, '
                       "except of 'conflict', 'keywords', 'require', 'require-dev' and 'scripts'.",
            'autoload': {
                'psr-4': {
                    f'{namespace}\\': 'src'
                },
            },
            'autoload-dev': {
                'psr-4': {
                    f'{namespace}\\Test\\': 'tests',
                },
            },
            'conflict': data.get('conflict', {}),
            'description': short_description,
            'funding': [
                {
                    'type': 'other',
                    'url': 'https://petrknap.github.io/donate.html',
                },
            ],
            'homepage': f'https://github.com/{name[0].lower()}/php-{name[1].lower()}',
            'keywords': data.get('keywords', []),
            'license': license_shortcut,
            'name': f'{name[0].lower()}/{camel_case_to_dashed(name[1])}',
            'require': data_require,
            'require-dev': data.get('require-dev', {}),
            'scripts': data.get('scripts', {}),
        }
        file.seek(0)
        file.truncate(0)
        file.write(json.dumps(
            {key: value for (key, value) in data.items() if value not in [None, {}]},
            indent=2,
        ) + '\n')
        print(data['name'])


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--file', type=str, required=True, help='Path to Composer file')
    parser.add_argument('--namespace', type=str, required=True, help='Base namespace')
    parser.add_argument('--php', type=str, required=True, help='Minimal required version of PHP')
    parser.add_argument('--license', type=str, required=True, help='License shortcut (MIT, LGPL-3.0-or-later)')
    parser.add_argument('--description', type=str, required=True, help='Short description')
    args = parser.parse_args()

    update_composer_file(args.file, args.namespace, args.php, args.license, args.description)