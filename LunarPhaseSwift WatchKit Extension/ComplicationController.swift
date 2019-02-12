//
//  ComplicationController.swift
//  LunarPhaseSwift WatchKit Extension
//
//  Created by Xcode Developer on 2/12/19.
//  Copyright © 2019 The Life of a Demoniac. All rights reserved.
//

import ClockKit
//import ExtensionDelegate

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
//    func complicationTemplateExtraLargeRingImage(text: NSString, ringStyle: CLKComplicationRingStyle, fillFraction: Float, color: UIColor) -> CLKComplicationTemplateExtraLargeRingImage
//    {
//        let template = CLKComplicationTemplateExtraLargeRingImage()
//        let delegate = WKExtension.sharedExtension().delegate as ExtensionDelegate
//        template.imageProvider = CLKImageProvider(onePieceImage: delegate().imageFromScene)
//        return CLKComplicationTemplateExtraLargeRingImage()
//    }
    
//    CLKComplicationTemplateExtraLargeRingImage *(^complicationTemplateExtraLargeRingImage)(NSString *, CLKComplicationRingStyle, float, UIColor *) = ^(NSString *text, CLKComplicationRingStyle ringStyle, float fillFraction, UIColor *color)
//    {
//    CLKComplicationTemplateExtraLargeRingImage *template = [[CLKComplicationTemplateExtraLargeRingImage alloc] init];
//    template.imageProvider = [CLKImageProvider imageProviderWithOnePieceImage:[[PlanetaryHourDataSource sharedDataSource] imageFromText](text, color, 72.0)];
//    template.ringStyle = ringStyle;
//    template.fillFraction = fillFraction;
//    template.tintColor = color;
//
//    return template;
//    };
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(nil)
    }
    
}
