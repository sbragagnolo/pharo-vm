echo "`cat .bintray.json | opensmalltalk-vm/.git_filters/RevDateURL.smudge`" > .bintray.json
sed -i.bak 's/$Rev: \([0-9][0-9]*\) \$/\1/' .bintray.json
sed -i.bak 's/$Date: \(.*\) \$/\1/' .bintray.json
rm -f .bintray.json.bak