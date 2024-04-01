FUSESOC_TARGET=pico_ice
FUSESOC_CORE=kwilke:experiments:manta-pico:1.0.0
UF2_FILE=manta-test.uf2

all: $(UF2_FILE)

$(UF2_FILE): top.sv pinout.pcf manta.v fusesoc.conf
	fusesoc run --target=$(FUSESOC_TARGET) $(FUSESOC_CORE)
	bin2uf2 -o $@ build/*/$(FUSESOC_TARGET)-icestorm/*.bin

manta.v: manta.yaml
	manta gen manta.yaml $@

fusesoc.conf:
	fusesoc library add local .

program: $(UF2_FILE)
	cp $(UF2_FILE) /media/kwilke/pico-ice/.

clean:
	rm -rf $(UF2_FILE) build/ manta.v fusesoc.conf
