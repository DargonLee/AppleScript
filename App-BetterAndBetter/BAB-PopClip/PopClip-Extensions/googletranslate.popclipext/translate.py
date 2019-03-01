# coding: utf-8
import argparse
import os
import commands
from urllib import unquote
import datetime

import requests
from googletrans import Translator


def showoutput(result):
    disk_prefix = commands.getoutput('osascript -e \'path to desktop as text\'').split(':')[0]
    icon_path = disk_prefix + os.getcwd().replace('/', ':') + ':gt.png'

    script = '\'display dialog "%s" with icon alias ("%s") with title "Google Translate" buttons {"Copy", "OK"} default button "OK" cancel button "Copy"\'' % (result, icon_path)
    res = commands.getoutput('osascript -e {}'.format(script))
    if not res.startswith('button'):
        os.system('echo "{}" | /usr/bin/pbcopy'.format(result))

def calc_version(version_num_str):
    version = version_num_str.strip().split('.')
    if len(version) == 2:
            version = int(version[0]) * 100 + int(version[1]) * 10
    elif len(version) == 3:
            version = int(version[0]) * 100 + int(version[1]) * 10 + int(version[2])
    return version

def check_update():
    now_time = datetime.datetime.today()
    now_year, now_month, now_day = now_time.year, now_time.month, now_time.day
    now_time_stamp = '{}-{}-{}'.format(now_year, now_month, now_day)
    if now_day % 7 == 0:
        check = open('check', 'r').read().strip()
        if check != now_time_stamp:
            open('check', 'w').write(now_time_stamp)

            version_url = 'https://github.com/wizyoung/googletranslate.popclipext/blob/master/src/version?raw=true'
            version_response = requests.get(version_url)
            if version_response.status_code == 200:
                remote_version_str = version_response.content
                remote_version = calc_version(remote_version_str)
                current_version_str = open('./version', 'r').read()
                current_version = calc_version(current_version_str)

                if remote_version > current_version:
                    script = '\'display dialog "Found a new version %s -- Your current version is %s.\n\nClick OK to download." with title "Check Update" buttons {"Cancel", "OK"} default button "OK" cancel button "Cancel"\'' % (remote_version_str, current_version_str)
                    btn_res = commands.getoutput('osascript -e {}'.format(script))
                    if btn_res.startswith('button'):
                        import webbrowser
                        webbrowser.open('https://github.com/wizyoung/googletranslate.popclipext/releases')


LANGUAGES = {
    'Afrikaans': 'af',
    'Albanian': 'sq',
    'Amharic': 'am',
    'Arabic': 'ar',
    'Armenian': 'hy',
    'Azerbaijani': 'az',
    'Basque': 'eu',
    'Belarusian': 'be',
    'Bengali': 'bn',
    'Bosnian': 'bs',
    'Bulgarian': 'bg',
    'Catalan': 'ca',
    'Cebuano': 'ceb',
    'Chichewa': 'ny',
    'Chinese_Simplified': 'zh-CN',
    'Chinese_Traditional': 'zh-TW',
    'Corsican': 'co',
    'Croatian': 'hr',
    'Czech': 'cs',
    'Danish': 'da',
    'Dutch': 'nl',
    'English': 'en',
    'Esperanto': 'eo',
    'Estonian': 'et',
    'Filipino': 'tl',
    'Finnish': 'fi',
    'French': 'fr',
    'Frisian': 'fy',
    'Galician': 'gl',
    'Georgian': 'ka',
    'German': 'de',
    'Greek': 'el',
    'Gujarati': 'gu',
    'Haitian_creole': 'ht',
    'Hausa': 'ha',
    'Hawaiian': 'haw',
    'Hebrew': 'iw',
    'Hindi': 'hi',
    'Hmong': 'hmn',
    'Hungarian': 'hu',
    'Icelandic': 'is',
    'Igbo': 'ig',
    'Indonesian': 'id',
    'Irish': 'ga',
    'Italian': 'it',
    'Japanese': 'ja',
    'Javanese': 'jw',
    'Kannada': 'kn',
    'Kazakh': 'kk',
    'Khmer': 'km',
    'Korean': 'ko',
    'Kurdish': 'ku',
    'Kyrgyz': 'ky',
    'Lao': 'lo',
    'Latin': 'la',
    'Latvian': 'lv',
    'Lithuanian': 'lt',
    'Luxembourgish': 'lb',
    'Macedonian': 'mk',
    'Malagasy': 'mg',
    'Malay': 'ms',
    'Malayalam': 'ml',
    'Maltese': 'mt',
    'Maori': 'mi',
    'Marathi': 'mr',
    'Mongolian': 'mn',
    'Myanmar': 'my',
    'Nepali': 'ne',
    'Norwegian': 'no',
    'Pashto': 'ps',
    'Persian': 'fa',
    'Polish': 'pl',
    'Portuguese': 'pt',
    'Punjabi': 'pa',
    'Romanian': 'ro',
    'Russian': 'ru',
    'Samoan': 'sm',
    'Scots_gaelic': 'gd',
    'Serbian': 'sr',
    'Sesotho': 'st',
    'Shona': 'sn',
    'Sindhi': 'sd',
    'Sinhala': 'si',
    'Slovak': 'sk',
    'Slovenian': 'sl',
    'Somali': 'so',
    'Spanish': 'es',
    'Sundanese': 'su',
    'Swahili': 'sw',
    'Swedish': 'sv',
    'Tajik': 'tg',
    'Tamil': 'ta',
    'Telugu': 'te',
    'Thai': 'th',
    'Turkish': 'tr',
    'Ukrainian': 'uk',
    'Urdu': 'ur',
    'Uzbek': 'uz',
    'Vietnamese': 'vi',
    'Welsh': 'cy',
    'Xhosa': 'xh',
    'Yiddish': 'yi',
    'Yoruba': 'yo',
    'Zulu': 'zu'}


if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument('query', nargs='?', default=None)
    parser.add_argument('--site', dest='site', nargs='?', default=None)
    parser.add_argument('--srclang', dest='srclang', nargs='?', default=None)
    parser.add_argument('--destlang', dest='destlang', nargs='?', default=None)
    args = parser.parse_args()

    site = args.site
    srclang = args.srclang
    destlang = args.destlang
    query = args.query

    unquoted_query = unquote(query)
    query = unquoted_query.decode('utf-8')

    if site == 'translate.google.cn':
        service_urls = ['translate.google.cn']
    elif site == 'translate.google.com':
        service_urls = ['translate.google.com']

    translator = Translator(service_urls=service_urls, timeout=30)

    detectedlang = translator.detect(query).lang

    # not using 'if detectedlang != LANGUAGES[srclang]' for exceptions like
    # 'zh-CNja' and 'ja' are both Japanese
    if LANGUAGES[srclang] not in detectedlang:
        result = translator.translate(query, dest=LANGUAGES[srclang]).text.encode('utf-8')
    else:
        result = translator.translate(query, dest=LANGUAGES[destlang]).text.encode('utf-8')

    showoutput(result)
    check_update()
