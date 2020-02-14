Name:       %name%
Version:    1
Release:    1
Summary:    Most simple RPM package
License:    FIXME

%description
This is my first RPM package, which does nothing.

%prep
# we have no source, so nothing here

%build
cat > %name%.sh <<EOF
#!/usr/bin/bash
echo Hello world
EOF

%install
mkdir -p %{buildroot}/usr/bin/
install -m 755 %name%.sh %{buildroot}/usr/bin/%name%.sh

%files
/usr/bin/%name%.sh

%changelog
# let skip this for now