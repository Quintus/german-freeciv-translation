#!/bin/sh
if [ -d freeciv-2.4 ]; then
    echo "Updatig local Freeciv copy..."
    cd freeciv-2.4
    svn update
    cd ..
else
    echo "Cloning Freeciv repository..."
    svn co svn://svn.gna.org/svn/freeciv/S2_4 freeciv-2.4
fi

echo "Configuring Freeciv..."
cd freeciv-2.4
./autogen.sh

echo "Synchronising translation files..."
cd po
rm de.po
cp ../../de.pox de.po
make de.pox
cd ../..
cp freeciv-2.4/po/de.pox de.pox.NEW

echo "Finished."
echo "See whether the .NEW file is usable."
