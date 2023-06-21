Updating Rust ebuilds
=====================

1. Enter the directory for a Rust repo:

   ```cd /var/db/repos/salfter/dev-embedded/pineflash/```

2. Version-bump the ebuild:

   ```git mv pineflash-0.5.0.ebuild pineflash-0.5.1.ebuild```

3. Download the new tarball and unpack it:

   ```sudo ebuild pineflash-0.5.1.ebuild digest```

   ```tar xf /var/cache/distfiles/pineflash-0.5.1.tar.gz```

4. Get updated dependencies (the CRATES variable in the ebuild):

   ```cd PineFlash-0.5.1/```

   ```cargo ebuild --noaudit```

5. Update CRATES in the ebuild and clean up:

   ```cd ..```

   ```joe pineflash-0.5.1.ebuild PineFlash-0.5.1/pineflash-0.5.1.ebuild```

   ```rm -r PineFlash-0.5.1/ *~```

6. Update manifest and test ebuild

   ```sudo ebuild pineflash-0.5.1.ebuild digest clean install clean```

