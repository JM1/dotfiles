# 2022 Jakob Meng, <jakobmeng@web.de>
# vim:set fileformat=unix tabstop=8 shiftwidth=4 expandtab autoindent:
# kate: end-of-line unix; space-indent on; indent-width 4;
# Useful utilities and services over DNS
# Ref.: https://www.dns.toys/

function dy { dig +noall +answer +additional "$1" @dns.toys; }

alias dy_ip='dy ip'
alias dy_help='dy help'
alias dy_weather_hennef='dy hennef.weather'
